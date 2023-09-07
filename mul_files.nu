def multiply_file [filename: string, n:int] {
  let f = $filename | path expand

  let file_record = $f | path parse
  let parent = $file_record | get parent
  let stem = $file_record | get stem
  let ext = $file_record | get extension

  let base = $parent | path join $stem

  for $x in 1..$n {
    let filename = $'($base)_($x).($ext)'
    cp $f $filename
  }
}

def multiply_all_files [p: string, n:int] {
  ls $p | get name | each { |f| multiply_file $f $n} | ignore
}