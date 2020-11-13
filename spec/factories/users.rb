FactoryBot.define do
  factory :user ,class: User do
    name {"sample"}
    email {"sample@sample.com"}
    password {"fancy0714"}
    password_confirmation {"fancy0714"}
    admin {false}
    activation_digest {"$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi"}
    activated {true}
    activated_at {"2020-10-15 02:32:43"}
  end

  factory :admin ,class: User do
    name {"admin"}
    email {"sample@sample.com"}
    password {"fancy0714"}
    password_confirmation {"fancy0714"}
    admin {true}
    activation_digest {"$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi"}
    activated {true}
    activated_at {"2020-10-15 02:32:43"}
  end
end