function [x, y, h] = newton_raphson_1(fun, fun_poch, x0, maxit, eps)
    h = NaN(maxit, 3);
    y0 = x0; 
    for i=1:maxit
        y0 = y0 - fun(y0) / fun_poch(y0);
        h(i, :) = [i y0 fun(y0)];
        if abs(fun(y0)) <= eps
            fprintf('Function is close enough (%g <= %g)\n', abs(fun(y0)), eps);
            fprintf('Stopped after %d iterations\n', i);
            break;
        end
        if i == maxit
            fprintf('Maximum number of iterations reached!\n');
        end
    end
    x = y0;
    y = fun(x);
end

