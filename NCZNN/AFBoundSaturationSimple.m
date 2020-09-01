function output = AFBoundSaturationSimple (param)
    regulationNum = 1;
%     regulationNumTwo = -0.75;
%     regulationNum = 0.2;
    output = zeros (size (param));

    vecReal = real(param);
    vecImag = imag(param);

% --------------------------------------------
    for j = 1 : length (param)
        if vecReal(j) > regulationNum
            vecReal(j) = regulationNum;
        end
        if vecReal(j) < -regulationNum
            vecReal(j) = -regulationNum;
        end
        if vecImag(j) > regulationNum
            vecImag(j) = regulationNum;
        end
        if vecImag(j) < -regulationNum
            vecImag(j) = -regulationNum;
        end
    end
% ---------------------------------------------
    param = vecReal + vecImag * i;
    
    for j = 1 : length (param)
        output(j) = param(j);
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%     for j = 1 : length (param)
%         if vecReal(j) > 1
%             vecReal(j) = 1;
%         end
%         if vecReal(j) < -1
%             vecReal(j) = -1;
%         end
%     end
%     
%     for j = 1 : length (param)
%         if vecImag(j) > 1
%             vecImag(j) = 1;
%         end
%         if vecImag(j) < -1
%             vecImag(j) = -1;
%         end
%     end