# Typed reference for the handwritten derivation

The authentic two-page derivation in this folder checks Proposition 2. Starting from the solo and delegation surpluses, it derives the thresholds `T^S` and `T^D`, uses Assumption 1 to obtain `T^1 = T^S`, and simplifies the delegation benefit

\[
B=T^S-T^D.
\]

The manual sign check establishes that `B > 0` implies `T^D < T^S`. Defining

\[
Z^1=\mathbf 1\{\omega\ge T^S\},\qquad
Z^2=\mathbf 1\{\omega\ge T^D\},
\]

the three-region argument gives

\[
Z^2-Z^1=\mathbf 1\{T^D\le\omega<T^S\}.
\]

For a continuous opportunity distribution `F`, the average expansion is

\[
\mathbb E[Z^2-Z^1]=F(T^S)-F(T^D).
\]

The handwritten calculation is valuable because the long subtraction can conceal sign errors and the endpoint convention must be checked explicitly.
