%Scruggs 4/9/19 for looping rrho

rrho = [0.0 0.5 0.9 1.0];
first_time = 1;
for i=1:length(rrho)
    rrho = [0.0 0.5 0.9 1.0];
    if first_time
        set_param_value('rrho',rrho(i));
        dynare plainRBC.mod noclearall;
        first_time = 0;
    else
        set_param_value('rrho',rrho(i));
        dynare plainRBC.mod noclearall;
    end
end