class HomeController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def adminmain
   @batchs = Batch.select(:batchbookname).distinct.to_a


    if params[:button] == 'addbatch' then
      redirect_to batchbooknew_path
    end

    if params[:button] == 'logout' then
      session[:access]= '0'
      redirect_to login_path
    end

    if params[:search] == 'search' then
      @studentid = params[:studentid]

      @student = "select * from batches where studentid='"+@studentid+"'"
      @student_list = ActiveRecord::Base.connection.execute(@student)

      @student_list.each do |studentss|
        @batchbook = studentss['batchbookname']
        @studentid = studentss['studentid']
        @name = studentss['studentname']
        @fos = studentss['fos']
        @status = studentss['status']
        @dateofentry = studentss['creationdate']
        @enddate = studentss['expirydate']
      end


    end

    if params[:search] == 'option' then

      @batch_option = params[:batch]
      @batch_sql = "select * from batches where batchbookname='"+ @batch_option+"'"
      @batch_result = ActiveRecord::Base.connection.execute(@batch_sql)
    end

  end


  def index
    if params[:button] == 'insert' then
      @id = params[:studentid]
      @name = params[:studentname]
      @fos = params[:fos]
      #@expdate = params[:expirydate]
      @expdate = session[:expirydate]
      @batchname = session[:batchbookname]
      @time_now = Time.now.strftime("%m%d%Y")
      #redirect_to show_path(:id => @id , :name => @name, :fos => @fos , :expdate => @expdate)
      #@insert_sql = "Insert into batchbooklists(studentid,studentname,fos,status,creationdate,created_at,updated_at) values(#{@id},#{@name},#{@fos},'0',#{@time_now},#{@time_now},#{@time_now})"
      # @result = ActiveRecord::Base.connection.execute(@insert_sql)
      object = Batch.new(:studentid =>@id,:studentname => @name,:fos => @fos,:status => '0',:creationdate => @time_now,:expirydate => @expdate,:batchbookname => @batchname)
      object.save
      #@result = ActiveRecord::Base.connection.execute(@user_insert)
    else
      puts 'hello'
      #redirect_to index_path()
    end
  end

  def login
    if params['button'] == 'login' then
      @username = params[:username]
      @password = params[:password]
      #redirect_to bootstrap_path(:aa => @username)
      @sql = "select accesscontrol from credentials where (email='"+@username+"' AND password ='"+@password+"')"
      @sql_result = ActiveRecord::Base.connection.execute(@sql)

      @sql_result.each do |query|
        if query['accesscontrol'] == 'admin' then
          session[:access] = query['accesscontrol']
          redirect_to adminmain_path
        end
      end

    end
  end

  def batchbooknew
    if params[:month]!=nil and params[:year]!=nil and params[:expirydate] != nil then
      session[:batchbookname] = params[:month] + params[:year]
      session[:expirydate] = params[:expirydate]
      redirect_to index_path
    end
  end

  def pendingbatch
    if params['pending'] != nil then
      @id = params['pending']
      @update_sql = "update batches set status='1' where studentid='"+@id+"'"
      @result_update_sql = ActiveRecord::Base.connection.execute(@update_sql)
    end
    @pending = "select * from batches where status='0'"
    @result_pending = ActiveRecord::Base.connection.execute(@pending)
  end

  def batchlist
    @bookcomp = "select * from batches where status='1'"
    @result_bookcomp = ActiveRecord::Base.connection.execute(@bookcomp)
  end

  def duebatchbook
    @time_now = Time.now.strftime("%m%d%Y")
    session[:timenow]=@time_now
    @due = "select * from batches where (expirydate <'"+@time_now+"'AND status='0')"
    @result_due = ActiveRecord::Base.connection.execute(@due)
  end

  def logout

  end



  def bootstrap

  end



end
