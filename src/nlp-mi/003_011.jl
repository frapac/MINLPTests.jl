# Test Goals:
# - non-linear objective and non-linear constraints
# - NLobjective with offset

m = Model(solver=solver)

@variable(m, x, Int)
@variable(m, y, Int)

@NLobjective(m, Max, sqrt(x+0.1) + pi)
@NLconstraint(m, y >= exp(x-2) - 2)
@NLconstraint(m, y <= sin(x)^2 + 2)

status = solve(m)

check_status(status)
check_objective(m, 4.9022743473660775)
check_solution([x,y], [3, 2])
