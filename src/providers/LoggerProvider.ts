/* eslint-disable no-unused-vars */
/* eslint-disable no-param-reassign */
import { format as dateFormat } from 'date-fns';
import winston, { format } from 'winston';

const { Console } = winston.transports;

const custom = format((info, _opts) => {
  const date = dateFormat(new Date(), 'dd/MM HH:mm:ss');

  if (info.level === 'info') {
    // Setting level to blue and message to green
    info.level = `\x1b[37m\u001b[0m[\u001b[32m\u001b[1m${info.level.toUpperCase()}\x1b[37m\u001b[0m]`;
    info.message = `\u001b[32m\u001b[1m${
      info.message
    } \x1b[30m\u001b[1m${date.toString()}\x1b[37m\u001b[0m`;
  } else if (info.level === 'error') {
    // Setting level and message to red
    info.level = `\x1b[37m\u001b[0m[\u001b[31m\u001b[1m${info.level.toUpperCase()}\x1b[37m\u001b[0m]`;
    info.message = `\u001b[31m\u001b[1m${
      info.message
    } \x1b[30m\u001b[1m${date.toString()}\x1b[37m\u001b[0m`;
  } else if (info.level === 'warn') {
    // Setting level and message to yellow
    info.level = `\x1b[37m\u001b[0m[\u001b[33m\u001b[1m${info.level.toUpperCase()}\x1b[37m\u001b[0m]`;
    info.message = `\u001b[33m\u001b[1m${
      info.message
    } \x1b[30m\u001b[1m${date.toString()}\x1b[37m\u001b[0m`;
  }

  return info;
});

const Logger = winston.createLogger({
  format: winston.format.combine(custom(), winston.format.simple()),
  transports: [new Console()]
});

export { Logger };
