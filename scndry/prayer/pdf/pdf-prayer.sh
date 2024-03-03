awk '{
    split($1, date, "-");
    $1 = date[1] " " tolower(date[2]);

    for (i = 5; i <= 7; i++) {
        if ($i ~ /[0-9]+:[0-9]+/) {  # Check if the field looks like a time
            split($i, time, ":");
            time[1] = time[1] + 12;  # Add 12 to the hour
            if (time[1] == 24) time[1] = 0;  # Adjust if the new hour equals 24
            $i = time[1] ":" time[2];
        }
    }
    print
}'
