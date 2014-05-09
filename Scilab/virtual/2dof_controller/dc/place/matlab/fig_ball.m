dat = [t' poly_y poly_u];
save -ASCII figures/ball.dat dat
dat = [t' y (-K*x')'];
save -ASCII figures/ball_state.dat dat
