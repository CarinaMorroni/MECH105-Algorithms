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

