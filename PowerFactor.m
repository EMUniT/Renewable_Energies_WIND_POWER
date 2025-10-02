function Cp = PowerFactor(lambda,pitch_angle)

    % EXPONENTIAL Power factor
    one_over_kappa = 1./(lambda + 0.08*pitch_angle) - 0.035/(1+pitch_angle^3);
    Cp = 0.55 * (116 * one_over_kappa - 0.4*pitch_angle - 5) .* exp(-21*one_over_kappa);

end