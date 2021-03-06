# Test Goals:
# - linear objective and non-linear constraints

m = Model(solver=solver)

@variable(m, x)
@variable(m, y)

@objective(m, Max, x)
@NLconstraint(m, y >= exp(x-2) - 2)
@NLconstraint(m, y <= sin(x)^2 + 2)

status = solve(m)

check_status(status)
check_objective(m, 3.4028339567042485)
check_solution([x,y], [3.4028339561149266, 2.0667085252601867])
