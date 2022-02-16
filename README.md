# README
```
       URI Pattern                                                                              Controller#Action
GET    /api/v1/sleep_records(.:format)                                                          api/v1/sleep_records#index {:format=>:json}
GET    /api/v1/sleep_records/friend_records(.:format)                                           api/v1/sleep_records#friend_records {:format=>:json}
POST   /api/v1/sleep_records/create(.:format)                                                   api/v1/sleep_records#create {:format=>:json}
PUT    /api/v1/sleep_records/:id/complete(.:format)                                             api/v1/sleep_records#complete {:format=>:json}
DELETE /api/v1/sleep_records/:id(.:format)                                                      api/v1/sleep_records#delete {:format=>:json}
POST   /api/v1/users/follow(.:format)                                                           api/v1/users#follow {:format=>:json}
POST   /api/v1/users/unfollow(.:format)                                                         api/v1/users#unfollow {:format=>:json}
```
