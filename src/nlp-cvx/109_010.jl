# Test Goals:
# - convex logarithmic objective
# - binding nonlinear constraint
# Variants
#   010 - binding constraint (inflection point)
#   011 - binding constraint (non-inflection point)
#   012 - binding constraint (non-inflection point)

m = Model(solver=solver)

@variable(m, x, start=0.1)
@variable(m, y, start=0.1)

@NLobjective(m, Max, log(x))
@NLconstraint(m, (y-2)^2 <= -x+2)

status = solve(m)

check_status(status)
check_objective(m, log(2))
check_solution([x,y], [2, 2])
