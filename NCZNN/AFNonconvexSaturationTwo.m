function output = AFNonconvexSaturationTwo (param)
   
    output = zeros (size (param));
    
    vecReal = real(param);
    vecImag = imag(param);
    
    for j = 1 : length(param)
        if vecReal(j) > 0.5
            vecReal(j) = 3;
        end
        if vecReal(j) < -0.5
            vecReal(j) = -3;
        end
    end
    
    for k = 1 : length(param)
        if vecReal(k) > 0.1
            if vecReal(k) < 0.3
                vecReal(k) = 0.1;
            end
        end
        if vecReal(k) < -0.1
            if vecReal(k) > -0.3
                vecReal(k) = -0.1;
            end
        end
    end

    for j = 1 : length(param)
        if vecImag(j) > 0.5
            vecImag(j) = 3;
        end
        if vecImag(j) < -0.5
            vecImag(j) = -3;
        end
    end
    
    for k = 1 : length(param)
        if vecImag(k) > 0.1
            if vecImag(k) < 0.3
                vecImag(k) = 0.1;
            end
        end
        if vecImag(k) < -0.1
            if vecImag(k) > -0.3
                vecImag(k) = -0.1;
            end
        end
    end
% ------------------------------------------
    param = vecReal + vecImag * i;
    
    for j = 1 : length (param)
        output(j) = param(j);
    end
    