function [v_t] = Kaimal(v, I, L, N_freq, f_n, phi_n, time, T_sim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Spettro Kaimal
    S_mode = @(fn) (4 * (I * v)^2 * L) ./ (v .* (1 + 6 * fn * L / v).^(5/3));
    
    %Calcolo del segnale v(t)
    v_t = v * ones(size(time)); % Inizializzazione del segnale con la velocità media
    for n = 1:N_freq
        % Ampiezza armonica basata sullo spettro
        amp = sqrt(2 * S_mode(f_n(n)) * (1 / T_sim));
        % Somma delle componenti sinusoidali
        v_t = v_t + amp * cos(2 * pi * f_n(n) * time - phi_n(n));
    end
end

