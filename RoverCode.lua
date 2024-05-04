local K_THROTTLE = 2
local K_STEERING = 3
local RELAY_IN1 = 2
local RELAY_IN2 = 3
local RELAY_IN3 = 4
local RELAY_IN4 = 5
local RELAY_IN1_STATE = 0
local RELAY_IN2_STATE = 0
local RELAY_IN3_STATE = 0
local RELAY_IN4_STATE = 0
local RELAY_MOTOR_LEFT = 'stop'
local RELAY_MOTOR_RIGHT = 'stop'


function update()
	if arming:is_armed() == false then
		SRV_Channels:set_output_pwm_chan(1, 0)
		SRV_Channels:set_output_pwm_chan(3, 0) 
		return update, 50
	end
  
  -- Throttle left 73
  -- Throttle right 74


	local motor_left = SRV_Channels:get_output_pwm(73) 
	local motor_right = SRV_Channels:get_output_pwm(74) 
	
	gcs:send_text(3, "motor right: " .. motor_right)
	gcs:send_text(3, "motor left: " .. motor_left)
  
	if motor_right == 1500 then
		if RELAY_IN1_STATE ~= 0 or RELAY_IN2_STATE ~= 0 then
			relay:off(RELAY_IN1)
			relay:off(RELAY_IN2)
			RELAY_IN1_STATE = 0
			RELAY_IN2_STATE = 0
	  -- gcs:send_text(3, "Throttle: " .. motor_right .. ", RELAY_IN3: " .. RELAY_IN3_STATE .. ", RELAY_IN4: " .. RELAY_IN4_STATE)
		end
	elseif motor_right < 1500 then
		SRV_Channels:set_output_pwm_chan(1, math.floor(math.abs(1500 - motor_right)) * 2 + 1000)
		if RELAY_IN2_STATE == 0 then
			relay:on(RELAY_IN2)
			relay:off(RELAY_IN1)
			RELAY_IN2_STATE = 1
			RELAY_IN1_STATE = 0
  	  -- SERVO1_REVERSED:set(1)
	  -- gcs:send_text(3, "Throttle: " .. motor_right .. ", RELAY_IN3: " .. RELAY_IN3_STATE .. ", RELAY_IN4: " .. RELAY_IN4_STATE)
		end
	else
		SRV_Channels:set_output_pwm_chan(1, math.floor(math.abs(1500 - motor_right)) * 2 + 1000)
		if RELAY_IN1_STATE == 0 then
			relay:on(RELAY_IN1)
			relay:off(RELAY_IN2)
			RELAY_IN2_STATE = 0
			RELAY_IN1_STATE = 1
  	  -- SERVO1_REVERSED:set(0)
	  -- gcs:send_text(3, "Throttle: " .. motor_right .. ", RELAY_IN3: " .. RELAY_IN3_STATE .. ", RELAY_IN4: " .. RELAY_IN4_STATE)
		end
	end


	if motor_left == 1500 then
		if RELAY_IN3_STATE ~= 0 or RELAY_IN4_STATE ~= 0  then
			relay:off(RELAY_IN3)
			relay:off(RELAY_IN4)
			RELAY_IN3_STATE = 0
			RELAY_IN4_STATE = 0
	  -- gcs:send_text(3, "Steering: " .. motor_left .. ", RELAY_IN1: " .. RELAY_IN1_STATE .. ", RELAY_IN2: " .. RELAY_IN2_STATE)
		end
	elseif motor_left < 1500 then
		SRV_Channels:set_output_pwm_chan(3, math.floor(math.abs(1500 - motor_left)) * 2 + 1000)
		if RELAY_IN3_STATE == 0 then
			relay:on(RELAY_IN3)
			relay:off(RELAY_IN4)
			RELAY_IN3_STATE = 1
			RELAY_IN4_STATE = 0
	  -- SERVO3_REVERSED:set(1)
	  -- gcs:send_text(3, "Steering: " .. motor_left .. ", RELAY_IN1: " .. RELAY_IN1_STATE .. ", RELAY_IN2: " .. RELAY_IN2_STATE)
		end
	else
		SRV_Channels:set_output_pwm_chan(3, math.floor(math.abs(1500 - motor_left)) * 2 + 1000)
		if RELAY_IN4_STATE == 0 then
			relay:on(RELAY_IN4)
			relay:off(RELAY_IN3)
			RELAY_IN3_STATE = 0
			RELAY_IN4_STATE = 1
	  -- SERVO3_REVERSED:set(0)
	  -- gcs:send_text(3, "Steering: " .. motor_left .. ", RELAY_IN1: " .. RELAY_IN1_STATE .. ", RELAY_IN2: " .. RELAY_IN2_STATE)
		end
	end

	return update, 50
end
return update()
