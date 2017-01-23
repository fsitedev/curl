#!/usr/bin/env tarantool

-- Those lines of code are for debug purposes only
-- So you have to ignore them
-- {{
package.preload['curl.driver'] = '../curl/driver.so'
-- }}

local curl = require('curl')

http = curl.http()

local headers = { my_header = "1", my_header2 = "2" }

-- Sync request
local r = http:sync_get_request('https://tarantool.org', {headers=headers})
if r.code ~= 200 then
  error('request is expecting 200')
end
print('server has responsed, data', r.body)

-- Aync request
local my_ctx = {}

http:request('GET', 'tarantool.org', {
  read = function(cnt, ctx) end,
  write = function(data, ctx)
    print('server has responsed, data', data)
    return data:len()
  end,
  done = function(res, code, ctx)
    if cide ~= 200 then
      error('request is expecting 200')
    end
    print('server has responsed, statuses', res, code)
  end,
  ctx = my_ctx,
  headers = headers,
})

res = http:sync_request('GET', 'mail.ru')
print('GET', res.body)
res = http:sync_request('PUT', 'www.rbc.ru', '{data: 123}',
  {headers = {['Content-type'] = 'application/json'}})
print('PUT', res.body)