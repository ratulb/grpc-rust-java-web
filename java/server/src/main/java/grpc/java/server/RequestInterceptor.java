package grpc.java.server;

import io.grpc.Context;
import io.grpc.Contexts;
import io.grpc.Metadata;
import io.grpc.ServerCall;
import io.grpc.ServerCallHandler;
import io.grpc.ServerInterceptor;

class RequestInterceptor implements ServerInterceptor {

	 public static final Context.Key<Object> INTERCEPTED_HEADERS = Context.key("INTERCEPTED_HEADERS");
	 public static Metadata.Key<String> INJECTED_KEY  = 
		 Metadata.Key.of("x-interceptor", Metadata.ASCII_STRING_MARSHALLER);

	  @Override
	  public <ReqT, RespT> ServerCall.Listener<ReqT> interceptCall(
	      ServerCall<ReqT, RespT> call,
	      Metadata headers,
	      ServerCallHandler<ReqT, RespT> next) {
	    Object interceptedCallHeaders = interceptCall(headers);

	    Context context = Context.current().withValue(INTERCEPTED_HEADERS, interceptedCallHeaders);
	    return Contexts.interceptCall(context, call, headers, next);
	  }
	  public Object interceptCall(Metadata headers) {
		  if(!headers.containsKey(INJECTED_KEY)){
                      headers.put(INJECTED_KEY, "java");
                  }
		 return headers;
	  }
	}
