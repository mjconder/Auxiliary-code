// The following code verifies that for all generating pairs (x,y) of the alternating group A5
// and all subgroups <x,z> isomorphic to the dihedral group of order 10
// there is an element of the form x^i*y^j*x^k which commutes with z

G := AlternatingGroup(5);
list := {@ @};

// for each such triple (x,y,z) in A5, we form a set "check" containing the orders of all
// subgroups of the form <x^i*y^j*x^k, z>. 
// If 4 is not in "check" (i.e. none of these subgroups are the Klein four-group),
// then we append the triple (x,y,z) to the set "list"

for x,y,z in G do
    if Order(x) eq 5 and Order(y) eq 5 and sub<G | x,y> eq G and #sub<G|y,z> eq 10 then
        check:={@ @};
        for i,j,k in [0..4] do
            Include(~check, #sub<G|x^i*y^j*x^k,z>);
        end for;
        if not 4 in check then
            Include(~list,[x,y,z]);
        end if;
    end if;
end for;

// verify that "list" is empty
#list eq 0;
