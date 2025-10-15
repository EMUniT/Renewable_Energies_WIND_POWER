function [v_t] = Kaimal(V10, I, L, N_freq, f_n, phi_n, time, T_sim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Spettro Kaimal
    S_mode = @(f) (I^2*V10*L)./(1+1.5*(f*L)/V10).^(5/3);
    %Calcolo del segnale v(t)
    v_t = V10 * ones(size(time)); % Inizializzazione del segnale con la velocità media
    for n = 1:N_freq
        % Ampiezza armonica basata sullo spettro
        amp = sqrt(2 * S_mode(f_n(n)) * (1 / T_sim));
        % Somma delle componenti sinusoidali
        v_t = v_t + amp * cos(2 * pi * f_n(n) * time - phi_n(n));
    end
end

