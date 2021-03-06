m = Model(solver=solver)

@variable(m, x >= 0)
@variable(m, y >= 0)

@objective(m, Min, x^2 + (y-2)^2)
@NLconstraint(m, 2*x^2 - 4x*y - 4*x + 4 <= y)
@NLconstraint(m, y^2 <= -x+2)

status = solve(m)

check_status(status)
check_objective(m, 0.5927195187027438)
check_solution([x,y], [0.31567986647277146, 1.2978135998137839])
