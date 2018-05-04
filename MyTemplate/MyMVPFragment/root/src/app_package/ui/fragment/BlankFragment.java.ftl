package ${packageName}.ui${dotSubpackage};

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import ${superClassFqcn};

<#if useAdapter>
import ${packageName}.ui${dotSubpackage}.adapter.${adapterName};
</#if >

<#if packageName??>
import ${packageName}.R;
</#if>

import ${packageName}.utils.ActivityUtils;
import ${packageName}.utils.Injections;

public class ${className} extends ${superClassName} implements ${contractName}.View
<#if makeOnClickListener>
, ${adapterName}.ClickListener
</#if >
 {
    public static final String TAG = "${className}";
 
 <#if includePresenter>
	private ${contractName}.Presenter mPresenter  = new ${presenterName}();
 </#if >
 <#if useAdapter>
	private ${adapterName} mAdapter  = null;
 </#if >
 
	//private Serializable mParam = null;
    private View rootView = null;

    public ${className}() {
        // Required empty public constructor
    }

    public static ${className} newInstance(Object obj) {
        ${className} fragment = new ${className}();
        //Bundle bundle = new Bundle();
        //bundle.putSerializable(EXTRA_KEY_OBJECT, obj);
        //fragment.setArguments(bundle);
        return fragment;
    }
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //if (getArguments() != null) {
        //    mParam = getArguments().getSerializable(EXTRA_KEY_OBJECT);
        //}
    }

	
	<#if includeLayout>
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        rootView = inflater.inflate(R.layout.${fragmentName}, container, false);
        mPresenter = new ${presenterName}(Injections.provideSchedulerProvider(),
                Injections.provideAppDataManager(getBaseActivity()));
        initView(rootView);
        mPresenter.onAttach(this);
        initData();
        return rootView;
    }
	</#if>
	
	@Override
    protected void initView(View rootView) {

    }
	
	@Override
    protected void initData() {       
        //Set up Presenter's data        
		<#if useAdapter>
			mAdapter = new ${adapterName}(getApplicationContext());
			<#if makeOnClickListener>
			mAdapter.setClickListener(this);
			</#if >
		</#if >
    }
	
	@Override
    public void onClick(View view) {

    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
		mPresenter.onDetach();
    }
	
	<#if makeOnClickListener>
	@Override
    public void onItemClicked(View v, int position) {

    }
	</#if >
}