function tumorModelstate = tumorModel(t,state,params)
tumorModelstate = [
    -params{1}*state(1)*log(state(1)/state(2));
    params{2}*state(1)-params{3}*state(1)^(2/3)*state(2)-params{4}*state(2)*control_u(state(1),state(2),params{1},params{2},params{3},params{4}, params{5},params{6},params{7},params{8},params{9})
    ];
end
