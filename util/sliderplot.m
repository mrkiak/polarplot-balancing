function sliderplot
    mWeigthTarget = .5;                           
    tWeightTarget = 2;                              
    f = uifigure('Name', 'Vibration', 'Position', [50 50 1400 700]);
  
    %dial = uigauge(f);
  
    % Creating the slider and assigning 
    % its values to the dial/gauge created above
    mWeight = uislider(f, 'Orientation', 'vertical', 'Value', 0);
    mWeight.Limits = [0 360];


    tWeight = uislider(f, 'ValueChanged', ...
        @(src, event) changedial(src, dial));
    % setting limits
    tWeight.Limits = [0 360];
    tWeight.Value = 0;
end
  
% ValueChangedFcn event handler
function changedial(slid, dial)
    dial.Value = slid.Value;
end