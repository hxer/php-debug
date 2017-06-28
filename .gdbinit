
define dumpgc
	set $current = gc_globals.roots.next
	printf "GC buffer content:\n"
	while $current != &gc_globals.roots
		printzv $current.u.pz
		set $current = $current.next
	end
end
