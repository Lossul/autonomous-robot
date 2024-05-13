%brick = ConnectBrick('ROCK'); - Connecting Brick to PC
%brick.SetColorMode(3, 2); - Sets Color Mode 

%{
PORTS
1- Touch Sensor
3- Color Sensor
4- Ultrasonic Sensor
A- Left Large Motor
B- Right Large Motor
D- Medium Motor for Lifter 
%}

while 1
        %variable f taken so as to consider forward movement
        f=1; 

        %Car moves forward 
        brick.MoveMotor('A',63); %Sets Motor A with power 63
        brick.MoveMotor('B',50); %Sets Motor B with power 50
        
        %{
        touch variable stores value 0 or 1
        0 -> No touch 
        1 -> Touched
        %}

        touch = brick.TouchPressed(1);

        %{
        color vaiable stores the following values based on color detection
        1-Black 
        2-Blue
        3-Green
        4-Yellow 
        5-Red
        %}
        
        color=brick.ColorCode(3);

        %distance variable stores distance of nearest object from robot
        
        distance=brick.UltrasonicDist(4);
         

        if(distance>50)
            brick.StopAllMotors();
            disp('Stop');
            pause(2);
            f=0;
            disp('turning');

            %turn right
            brick.ResetMotorAngle('A');
            brick.MoveMotorAngleRel('A',100,420,'Brake');
            brick.WaitForMotor('A');
            brick.StopAllMotors('Brake');
    
            %move forward
            brick.MoveMotor('AB', 63);
            pause(3);
            brick.StopAllMotors();


        end

        if (touch==1) %If pressed
           f=0;
            %move back
            brick.MoveMotor('A',-50);
            brick.MoveMotor('B',-63);
            pause(2);
            brick.StopAllMotors();
    
            %turn left
            brick.ResetMotorAngle('B');
            brick.MoveMotorAngleRel('B',100,420,'Brake');
            brick.WaitForMotor('B');
            brick.StopAllMotors();
           
        end
    
       if f==1
           brick.MoveMotor('A',63);
           brick.MoveMotor('B',50);
           pause(1);
       end

        if color==1 || color==4  %Black or Yellow
            % Move forward
            brick.MoveMotor('AB',50);
            pause(0.5);
        end

        if color==5 %Red
            % Stop for 4 seconds
            brick.StopMotor('AB','Brake');
            pause(4)
            brick.MoveMotor('AB',50);
            pause(0.5); 
        end

        if color==3 || color==2 %Green or Blue- Activate keyboard controls
            %Green- Pickup
            %Blue- Dropoff
            disp('Keyboard control activated');
            
            %Now Keyboard Controls file will run
            run("KeyControls.m"); 
            brick.MoveMotor('AB',50);
            pause(6);
        end
end

