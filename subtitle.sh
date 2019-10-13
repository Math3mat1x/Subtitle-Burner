for filename in ${1}; do
        if [ ! -d "${2}" ]; then
                mkdir -p ${2}
        fi      
        
        if [[ -f "${2}/${filename}" ]]; then
                continue
        fi      
 	  
        name=$(basename "${filename}")
  	name_no_extension="${name%.*}"
	sub_file="${name_no_extension}.srt"
	subtitle_format=$(file -bi "$sub_file" | cut -d ';' -f2 - | cut -d '=' -f2 - | sed 's/\ //g')
        if [ ${subtitle_format} == "utf-8" ]; then # if it's not UTF-8, then it's CP1252
                subtitle_format="UTF-8"
        else    
                subtitle_format="CP1252" # should work with anything that isn't UTF-8 encoded. The format is compatible 
with ISO-8859-1
        fi      
        
        echo "Subtitle format : $subtitle_format"
        ffmpeg -hwaccel cuvid -i "${filename}" -vf subtitles="'${sub_file}'":charenc="'${subtitle_format}'" -c:v nvenc "${2}${name_no_extension}2.mp4"

done
