"""Numerical boundary check for Proposition 3."""

def gap(t: int, p1: float, p2: float) -> float:
    return (1 - p1) ** (t + 1) - (1 - p2) ** (t + 1)


for p2 in (0.25, 0.75, 1.0):
    values = [gap(t, 0.0, p2) for t in range(5)]
    increments = [values[t + 1] - values[t] for t in range(4)]
    print(f"p2={p2:.2f} gap={values} increments={increments}")

assert all(gap(t, 0.2, 0.6) >= 0 for t in range(20))
assert all(gap(t + 1, 0.0, 0.6) > gap(t, 0.0, 0.6) for t in range(10))
assert all(gap(t, 0.0, 1.0) == 1.0 for t in range(10))
print("PASS: weak nonnegativity and the p2=1 strictness counterexample are confirmed.")
