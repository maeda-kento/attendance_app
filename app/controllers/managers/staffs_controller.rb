class Managers::StaffsController < ApplicationController
  class Managers::StaffsController < ApplicationController
    require 'csv'
    before_action :set_staff, only: [:edit, :update, :destroy]
  
  
    def index
      @staffs = Staff.eager_load(staff_departments: :department,image_attachment: :blob)
      if params[:department_ids]
        @staffs = @staffs.where(departments: {id: params[:department_ids] })
        # binding.pry
        #　collection_check_boxs について調べ空文字配列の原因を調べる
      end
      if keyword = params[:keyword]
        @staffs = @staffs.where("first_name LIKE ?", "%#{keyword}%").or(@staffs.where("last_name LIKE ?","%#{keyword}%")).or(@staffs.where("email LIKE ?", "%#{keyword}%")).or(@staffs.where("birthed_on LIKE ?", "%#{keyword}%"))
      end
      if params[:sort] == ""
        @staffs = @staffs.order(id: :asc)
      elsif params[:sort] == "high_hourly_wage"
        @staffs = @staffs.order(hourly_pay: :desc)
      elsif params[:sort] == "low_hourly_rate"
        @staffs = @staffs.order(hourly_pay: :asc)
      end
      respond_to do |format|
        format.html
        format.csv do |csv|
          send_staff_csv(@staffs)
        end
      end
    end
  
    def edit
      
    end
  
    def update
      @staff.update(staff_params)
    end
    
    def destroy
      # if @staff.destroy
      #   redirect_to managers_staffs_path
      # end
    end
  
    def staff_params
      params.require(:staff).permit(:last_name, :first_name, :email, :birthed_on, :gender, :hourly_pay, :zipcode, :address, department_id: [])
    end 
    
    def send_staff_csv(staffs)
      csv_data = CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
        column_names = %w(id 氏 名 生年月日 性別)
        csv << column_names
        staffs.each do |staff|
          column_values = [
            staff.id,
            staff.last_name,
            staff.first_name,
            staff.birthed_on,
            staff.gender,
          ]
          csv << column_values
        end
      end
      send_data(csv_data, filename: "スタッフ情報一覧.csv")
    end
  
    private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    
    # 以下完了
    # 来週、検証すること
    # 多分、アテンダンスが関係しているからスタッフとの情報で繋がりがどのようにあるのか調べる！
    # destroyの理解も深めておくこと
    # 外部キーが要因でdestroyが機能していない
    # slackで送っていただいた記事を確認しておくこと
    # ActiveRecord::StatementInvalid: Mysql2::Error: Cannot delete or update a parent row: a foreign key constraint fails (`attendance_app_development`.`attendances`, CONSTRAINT `fk_rails_6ad3995c00` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)): DELETE FROM `staffs` WHERE `staffs`.`id` = 25
    # from C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/mysql2-0.5.5/lib/mysql2/client.rb:151:in `_query'
    # Caused by Mysql2::Error: Cannot delete or update a parent row: a foreign key constraint fails (`attendance_app_development`.`attendances`, CONSTRAINT `fk_rails_6ad3995c00` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`))
  end
end
