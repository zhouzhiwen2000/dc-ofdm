function same = iskindaequal(a,b, error)
%ISKINDAEQUAL Given two double or float numbers, this function returns
%"true" if the signals are close enough to be considered equal.
arguments(Input)
    a
    b
    error=1e-12
end
    same = ~logical(sum(abs(a - b) > error));
end

