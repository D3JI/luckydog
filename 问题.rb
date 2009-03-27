2) <%= image_tag("../images/#{@space.stylename}.jpg")%> 用f.stylename获取不到
6)map.resources :控制器名 控制器单复数与resource/resources保持一致.这是错的.  resource对应的控制器名必须是复数.  而resources对应的可以是复数,也可以是单数.生成的资源不一样.
7)如果从action传过变量@theme = Theme.new.来,在view里的form_for中:theme会自动作字段的验证.
9)form_for @user 当update时不验证.
10) helper path 传id  传入的参数可以是单一的,也可以是个hash

has_many :跟的是表名还是模型的名字.多对多表时用_??还是不用??
<%= link_to '我的好友', :controller => 'friends', :user_id => @user%>与 <%= link_to '我的好友', :controller => 'friends', :id => @user%>产生的路由不同,自动通过REST匹配上资源前缀


1)@space = @user.space.create(:address => "i.#{request.host}/#{@user.username}")   nil.create.得不到user_id.晕...
3) redirect_to :controller => 'admin/site', :action => 'login'
4)NoMethodError
er)reset_session: 产生的record_id问题.
8)redirect_to request.url (如何转向删除前的一个request_url)
11)自定义map.resources collection/member 所指定的action方法时要指定http访问方法.并在调用时显示指定.



belongs_to
has_many
conditions
link_to
flash[:notice]
flash[:error]
:dependent => :destroy
:counter_cache => true
map.resources
<% @entry.comments.each do |comment|%>
<% form_for :comment, :url => space_path(:id => @space) do |f|%>
<%= f.text_field :name %>
<%= submit_tag 'Ok'%>
<% end %>
@users = User.find(:all, :order => 'created_at desc')
