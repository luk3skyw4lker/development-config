import { app } from './app';
import { Logger } from './providers/LoggerProvider';

app.listen(3001, () => {
  Logger.info('SERVER RUNNING ON 3001');
});
