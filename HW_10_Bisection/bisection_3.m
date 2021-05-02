clear;

f = @(x)((4+x)/(((42-2.*x).^2) .* (28-x))) - 0.016
root = bisection(f,0,20,0.5)

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
   
   error = ((new_x - old_input)/new_x)*100
   old_input = new_x;
   
   new_x = (x1+x2)/2; 
end
end