function rowsym = coeff_extract(M,A,rowsym,order)
%COEFF_EXTRACT Summary of this function goes here
q = 0;
for rows = 1:(order + 1)
    if rows ==1
        q = q+1;
    end
    rows;
    x = has(M, A(rows));
    if x == true
        coeff = coeffs(M, A(rows));
        C = coeff(2);
        try
            rowsym(q,rows) = C(2);
        catch
            rowsym(q,rows) = C(1);
        end
    else
        rowsym(q,rows) = 0;
    end
end
end

