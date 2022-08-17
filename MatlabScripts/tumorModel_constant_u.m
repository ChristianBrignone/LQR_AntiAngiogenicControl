
function tumorModelstate_constant_u = tumorModel_constant_u(t,state,params,u)
tumorModelstate_constant_u = [
    -params{1}*state(1)*log(state(1)/state(2));
    params{2}*state(1)-params{3}*state(1)^(2/3)*state(2)-params{4}*state(2)*u
    ];
end