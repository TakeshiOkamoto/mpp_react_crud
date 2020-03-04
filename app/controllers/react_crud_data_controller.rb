class ReactCrudDataController < ApplicationController
  before_action :set_datum, only: [:update, :destroy]
  
  # 英語のdataは複数形、datumは単数形
  
  def index
    @data = ReactCrudDatum.all.order(updated_at: "DESC") 
    
    respond_to do |format|

        # HTML用
        format.html
        
        # JSON用
        format.json { render json: @data}
        
        # JSONは次のような形式となる
        #
        #  [
        #    {"id":1,"name":"プチモンテ"}
        #    {"id":2,"name":"プチラボ"}
        #    {"id":3,"name":"@ゲーム"}        
        #  ]        
    end
  end
  
  # 全て初期化
  def new
    
    ActiveRecord::Base.transaction do 
      # 高速削除
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE react_crud_data;")
      # 高速挿入
      ActiveRecord::Base.connection.execute("INSERT INTO react_crud_data SELECT * FROM react_crud_data_bks;")
    end  
  
    redirect_to root_path
  end
    
  def create
    @datum = ReactCrudDatum.new(datum_params)

    respond_to do |format|
      if @datum.save
        format.json { render json: {registration: "Ajaxによるデータの登録が成功しました。", 
                                    id:  @datum.id, name:  @datum.name, comment:  @datum.comment, updated_at:  @datum.updated_at} }
      else
        format.json { render json: {registration: "Ajaxによるデータの登録が失敗しました。", 
                                    id:  "error"} }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.json { render json: {registration: "Ajaxによるデータの更新が成功しました。"} }
      else
        format.json { render json: {registration: "Ajaxによるデータの更新が失敗しました。"} }
      end
    end
  end  
  
  def destroy
    respond_to do |format|
      if @datum.destroy
        format.json { render json: {registration: "Ajaxによるデータの削除が成功しました。"} }
      else
        format.json { render json: {registration: "Ajaxによるデータの削除が失敗しました。"} }
      end
    end
  end
    
  private
  
    def set_datum
      @datum = ReactCrudDatum.find(params[:id])
    end
      
    def datum_params
      # 送信側のJSONの形式を確認する事！
      params.require(:datum).permit(:name, :comment)
    end
end
