program dos;
	const
		dimf = 10;
	type
		vector = array [1..dimf] of string;
	
	procedure cargarVector (var v: vector; var diml: integer);
		var
			nombre: string;
		begin
			readln(nombre);
			while ((diml <= dimf) and (nombre <> 'ZZZ')) do begin
				v[diml]:= nombre;
				diml:= diml + 1;
				readln(nombre);
			end;
		end;
		
	procedure eliminar ( var v:vector; var diml: integer);
		var
			nombre: string;
			i: integer;
			pos: integer;
		begin
      writeln();
			readln(nombre);
			i:= 1;
			while ( (v[i] <> nombre) and (i <= diml)) do begin
				i:= i + 1; 
			end;
			pos:= i;
			for i:= pos to (diml - 1) do
				v[i]:= v[i+1];
			diml:= diml - 1;
		end;
	
	procedure insertar ( var v:vector ; diml: integer);
		var
			pos: integer;
			nombre: string;
			i: integer;
		begin
			pos:= 4;
			if ((diml + 1) <= dimf) and (pos >= 1) and (pos <= diml) then begin
        writeln();
				readln(nombre);
				for i:= diml downto pos do
					v[i+1]:= v[i];
				v[pos]:= nombre;
				diml:= diml+1;
			end;
		end;
		
	procedure agregar ( var v:vector ; var diml: integer);
		var
			nombre: string ;
		begin
			if ((diml + 1) <= dimf) then begin
        writeln();
				readln(nombre);
				diml:= diml + 1;
				v[diml]:= nombre;
			end;
		end;
		
	var
		v: vector;
		diml: integer;
		i: integer;
	begin
		diml:= 1;
		cargarVector(v, diml);
		eliminar(v,diml);
		insertar(v,diml);
		agregar(v,diml);
    writeln();
		for i:= 1 to diml do
			writeln(v[i]);
	end.