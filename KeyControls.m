global key
InitKeyboard(); %Initializing keyboard function
while 1
    pause(0.1);
    switch key
        case 'uparrow'
            %Robot will move forward if this key is pressed
            disp('Up Arrow Pressed'); 

            % Both motors will move forward with the power of 50
            brick.MoveMotor('AB',50);  
            pause(0.2);
            brick.StopAllMotors();
            
        case 'downarrow'
            % Robot will move backward if the key is pressed
            disp('Down Arrow Pressed');

            % Both motors will move backward with the power of 50
            brick.MoveMotor('AB',-50); 
            pause(0.2);
            brick.StopAllMotors();
           
        case 'leftarrow'
            % Robot will move left if the key is pressed
            disp('Left Arrow is Pressed'); 

            brick.MoveMotor('A',-50);
            brick.MoveMotor('B',50);
            pause(0.1);
            brick.StopAllMotors();
            
        case 'rightarrow'
            %Robot will move right if the key is pressed
            disp('Right Arrow is Pressed'); 
            
            brick.MoveMotor('A',50);
            brick.MoveMotor('B',-50);
            pause(0.1);
            brick.StopAllMotors();
        
        case 'u'
            disp("Up"); %Robot's lifter will move upwards
            brick.MoveMotor('D',30);
            pause(0.2)
            brick.StopAllMotors();

        case 'd'
            disp("Down"); %Robot's lifter will move downwards
            brick.MoveMotor('D',-10);
            pause(0.2);
            brick.StopAllMotors();
            
        case 'q'
            brick.StopAllMotors(); % All motors will stop working
            break
    end
end
CloseKeyboard();

