function E = TotalEnergy(V_wind, rho_air, A_rotor, lambda_sweep, Cp_curve, R_rotor, omega_target)
    P_tot = 0;
    for i = 1:length(V_wind)
        V_req = V_wind(i);
        % Tip speed ratio at the requested velocity
        lambda_req = omega_target * R_rotor / V_req;
        % Interpolation of the power coefficient Cp using lambda
        Cp_req = PowerFactor(lambda_req, 0);        % Calculation of power using the wind power equation
        P = 0.5 * rho_air * A_rotor * V_req^3 * Cp_req; % Power in watts (W)
        if (P > 0 && P < 1.0241 * 1e7 && V_req < 25)
            P_tot = P_tot + P;
        end
    end
    E = P_tot * 1/6;
end

