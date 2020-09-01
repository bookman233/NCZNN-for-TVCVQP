function output = AFBallSaturation (param)

    if norm (param) > 1
       param = 1 * (param / norm (param));
    end
    output = param;
    
end