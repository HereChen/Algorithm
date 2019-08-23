# Pkg.add("ForwardDiff")
using ForwardDiff

"""
```
f(x) = x^2 - 2;
x0 = 1;
x = newton(f, x0);
```
"""
function newton(f, x0)
  # 求目标函数导数
  Δf = x -> ForwardDiff.derivative(f, x);

  xk = Base.float(x0);
  xk_1 = Base.float(x0);

  # 比机器精度少一个数量级
  epsilon = Base.eps(xk) * 10;

  while true
    xk_1 = xk - f(xk)/Δf(xk);
    if Base.abs(xk_1 - xk) < epsilon || Base.abs(f(xk_1)) < epsilon
      break;
    end
    xk = xk_1;
  end

  return xk_1;
end