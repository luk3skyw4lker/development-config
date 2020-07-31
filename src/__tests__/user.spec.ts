import { User } from '@models/User';

describe('User', () => {
  it('it should create user', () => {
    const user = new User();

    user.name = 'Lucas Henrique';

    expect(user.name).toEqual('Lucas Henrique');
  });
});
