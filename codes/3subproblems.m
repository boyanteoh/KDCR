function theta_list = subprob3(w, r, p, q, delta)
    w = w / norm(w);

    u = p - r;
    v = q - r;

    u_proj = u - w * (w' * u);
    v_proj = v - w * (w' * v);

    delta_proj_sq = delta^2 - (w' * (p - q))^2;

    if delta_proj_sq < -1e-10
        theta_list = [];
        return;
    end
