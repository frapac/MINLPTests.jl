# Test Goals:
# - non-linear objective and non-linear constraints
# - NLobjective with offset

m = Model(solver=solver)

@variable(m, x)
@variable(m, y)

@NLobjective(m, Max, sqrt(x+0.1) + pi)
@NLconstraint(m, y >= exp(x-2) - 2)
@NLconstraint(m, y <= sin(x)^2 + 2)

status = solve(m)

check_status(status)
check_objective(m, 5.013178596805878)
check_solution([x,y], [3.4028339561149266, 2.0667085252601867])
