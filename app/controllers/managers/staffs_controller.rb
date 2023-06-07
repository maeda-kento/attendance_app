class Managers::StaffsController < ApplicationController
  class Managers::StaffsController < ApplicationController
    before_action :set_staff, only: [:edit, :update, :destroy]
  
  
    def index
      @staffs = Staff.eager_load(staff_departments: :department,image_attachment: :blob)
      if params[:low_hourly_rate]
        @staffs = @staffs.low_hourly_rate
      elsif params[:high_hourly_wage]
        @staffs = @staffs.high_hourly_wage
      elsif params[:ID]
        @staffs = @staffs.ID
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
      params.require(:staff).permit(:last_name, :first_name, :email, :birthed_on, :gender, :department_id, :hourly_pay, :zipcode, :address)
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
