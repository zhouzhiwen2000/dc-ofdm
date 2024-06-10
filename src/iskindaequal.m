function same = iskindaequal(a,b)
%ISKINDAEQUAL Given two double or float numbers, this function returns
%"true" if the signals are close enough to be considered equal.
    same = ~logical(sum(abs(a - b) > 1e-12));
end

