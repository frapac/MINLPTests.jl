m = Model(solver=solver)

@variable(m, x, start=0.1)
@variable(m, y)

@objective(m, Min, -x+y)
@NLconstraint(m, exp(x-2.0) - 0.5 <= y)
@NLconstraint(m, log(x) + 0.5 >= y)

status = solve(m)

check_status(status)
check_objective(m, -3/2)
check_solution([x,y], [2, 1/2])
