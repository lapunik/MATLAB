function test()

    U0 = 10; R = 10; L = 3e-3;
    function didt = rce(t, i)
        didt = -R/L*i + U0/L;
    end

    function [t, i, tavg, n] = test(fce, n)
        h = 1e-1; eps = 1e-3;
        te = 0;
        for i = 1:n
            tic
            [t, i] = fce(@rce, 0, 0.01, 0, h, eps,0.01);
            te = te + toc;
        end
        tavg = te/n;
        n = length(t);
    end

figure()
xlabel('t (s)'); ylabel('i (A)')
hold on

[t, i] = euler(@rce, 0, 0.01, [0, 0], 1000);
plot(t, i, 'b-')

[t, i, tavg, n] = test(@aeuler_PI, 1000);
plot(t, i, 'bo')
fprintf("aeuler.m: %f s, %d\n", tavg, n)
end