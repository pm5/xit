require! <[cheerio request fs]>

data = []

error, response, body <- request.get 'http://axe-level-1.herokuapp.com/'
$ = cheerio.load body

subjects = $ 'table.table tr' .first!.children!.map (i, e) -> $(e).text!
subjects .= to-array!
subjects.shift!

row = $ 'table.table tr' .first!.next!
while row.text!
  columns = row.children!.map (i, e) -> $(e).text!
  columns .= to-array!
  name = columns.shift!
  data.push {name, grades: {[subjects[i], g] for g, i in columns.map -> +it}}
  row .= next!

data |> JSON.stringify |> fs.write-file-sync 'output.json', _
