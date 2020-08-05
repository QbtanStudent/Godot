extends Sprite

var maxLen = 70 #设置虚拟按键【半径】范围长度

var ondraging = -1

func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		#如果屏幕上拖动 或者 触摸屏幕 已按下
		
		var mouse_pos = (event.position - self.global_position).length()
		#获取点击的距离到原点的距离
		
		if mouse_pos <= maxLen or event.get_index() == ondraging:
			ondraging = event.get_index()
			#左手点击.get_index()返回0，再点击.get_index()返回1
			
			$point.set_global_position(event.position)
			#设置全局坐标为（事件[触摸]坐标）
		
		if get_point_pos().length() > maxLen :
			#控制按钮【point】向量范围在±70
		#.length()获取当前坐标的点距离原点的长度
		#如果按钮【point】的长度大于底图【Joystick】的长度
			$point.set_position(get_point_pos().normalized() * maxLen)
			#相对于父节点设置坐标
			#.normalized矢量化，控制在1的范围带负数
	if	 event is InputEventScreenTouch and !event.is_pressed():
		#触摸屏幕 释放按键
		if event.get_index() == ondraging:
			set_center()
			ondraging = -1
	pass

func get_point_pos():
	#封装多次使用的$point.position
	return $point.position

func set_center():
	$Tween.interpolate_property($point,"position",get_point_pos(),Vector2(0,0),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	#.interpolate_property(施加属性对象，属性名，Vector(0,0),过度时间，曲线，缓动效果)
	$Tween.start()
	#--$point.position = Vector2(0,0)
	#按钮【point】坐标为中心点

func get_now_pos():
	return get_point_pos().normalized()
