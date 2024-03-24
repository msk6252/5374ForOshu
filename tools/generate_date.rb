require 'date'

week_days = ['日', '月', '火', '水', '木', '金', '土']

puts "===== 日付を生成します。 ====="
puts "===== 開始日を入力してください。(yyyymmdd) ====="
start_date = gets
puts "===== 終了日を入力してください。(yyyymmdd) ====="
finish_date = gets
puts "===== 曜日を入力してください。(日 月 火 水 木 金 土) ====="
week_day = gets

week_day = week_day.split(' ')
wdays = []
week_day.each do |wday|
  wdays << week_days.find_index(wday)
end
p wdays

start_date_sp = start_date.split('-')
finish_date_sp = finish_date.split('-')

start_date = Date.new(
  start_date_sp[0].to_i,
  start_date_sp[1].to_i,
  start_date_sp[2].to_i
)
finish_date = Date.new(
  finish_date_sp[0].to_i,
  finish_date_sp[1].to_i,
  finish_date_sp[2].to_i
)

if start_date == finish_date
  puts "開始日と終了日が一緒です。"
  return
end

dates = []
while true do
  if wdays.include?(start_date.wday)
    dates << start_date.strftime('%Y%m%d')
  end
  start_date = start_date + 1
  if finish_date < start_date
    break
  end
end

puts dates.join(' ')