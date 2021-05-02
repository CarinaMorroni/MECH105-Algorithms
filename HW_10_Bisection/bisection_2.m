%Question 1
f = @(x) sqrt((9.81*95)/x) .* tanh(sqrt((9.81.*x)./95).*9) - 46
root = bisection(f,0.2,0.5,5)

function new_x = bisection(f,x1,x2,desired_error)

new_x = (x1+x2)/2

error = 100;
old_input = 0;

while error > desired_error
    if f(new_x) .* f(x1) < 0
        x2 = new_x
    else
        x1 = new_x
    end
   
   error = ((f(new_x) - old_input)/f(new_x))*100
   old_input = new_x;
   
   new_x = (x1+x2)/2; 
end
end


%Question 2
clear;

f = @(x)-12 - 21.*x + 18.*x.^2 - 2.75.*x.^3;
root = bisection(f,-1,0,1)

function new_x = bisection(f,x1,x2,desired_error)

new_x = (x1+x2)/2

error = 100;
old_input = 0;

while error > desired_error
    if f(new_x) .* f(x1) < 0
        x2 = new_x
    else
        x1 = new_x
    end
   
   error = ((f(new_x) - old_input)/f(new_x))*100
   old_input = new_x;
   
   new_x = (x1+x2)/2; 
end
end

